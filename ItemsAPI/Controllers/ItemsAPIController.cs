using Item.Domain.Abstract;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;

namespace ItemsAPI.Controllers
{
    [Route("Items")]
    public class ItemsController : ControllerBase
    {
        private readonly ILogger<ItemsController> _logger;
        private readonly IGetItems _IGetItems;
        private readonly IDeleteCategory _IDeleteCategory;

        public ItemsController(ILogger<ItemsController> logger, IGetItems IGetItems, IDeleteCategory IDeleteCategory)
        {
            _logger = logger;
            _IGetItems = IGetItems;
            _IDeleteCategory = IDeleteCategory;
        }
        [Microsoft.AspNetCore.Mvc.HttpGet]
        [Route("Get")]
        public void GetList()
        {
            //test
        }
        /// <summary>
        /// To get the item detail by Name
        /// </summary>
        /// <param name="name"></param>
        /// <param name="PageNumber"></param>
        /// <returns></returns>
        [Route("ItemsByName")]
        [HttpGet]
        public IEnumerable<object> ItemsByName(string name, int PageNumber)
        {

            List<Item.Domain.Models.Item> itemList = _IGetItems.GetItemsByname(name);
            int count = itemList.Count();

            //Page size is hard coded here, as in the requirement '10' is fixed
            int CurrentPage = PageNumber;
            int TotalCount = count;
            int TotalPages = (int)Math.Ceiling(count / (double)10);
            itemList = itemList.Skip((CurrentPage - 1) * 10).Take(10).ToList();
            var previousPage = CurrentPage > 1 ? "Yes" : "No";
            var nextPage = CurrentPage < TotalPages ? "Yes" : "No";

            var PageDetails = new
            {
                totalCount = TotalCount,
                pageSize = 10,
                currentPage = CurrentPage,
                totalPages = TotalPages,
                previousPage,
                nextPage
            };
            HttpContext.Response.Headers.Add("Paging-Headers", JsonConvert.SerializeObject(PageDetails));

            var returnItems = from item in itemList
                              select new
                              {
                                  item.Name,
                                  item.Description,
                                  SubCategoryName = item.SubCategory.Name,
                                  CategoryName = item.SubCategory.Category.Name
                              };
            return returnItems;
        }
        /// <summary>
        /// To remove a category and all dependencies
        /// </summary>
        /// <param name="categoryName"></param>
        /// <returns></returns>
        [Route("DeleteCategory")]
        [HttpGet]
        public string DeleteCategory(string categoryName)
        {
            if (_IDeleteCategory.DeleteCategoryItem(categoryName))
                return "Deleted";
            else
                return "Error";
        }
    }
}

