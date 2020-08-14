using Item.Domain.Abstract;
using Item.Domain.Models;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;

namespace Item.Domain.Concrete
{
    public class DeleteCategory : IDeleteCategory
    {
        public bool DeleteCategoryItem(string name)
        {
            bool flag = false;
            using (var context = new ItemAPIContext())
            {

                Item.Domain.Models.Category category = context.Category.Where(x => x.Name.Contains(name)).Include(x => x.SubCategory).FirstOrDefault();

                if (category != null)
                {
                    //We can use on delete cascade also.
                    context.Category.Remove(category);
                    context.SubCategory.RemoveRange(category.SubCategory);
                    foreach (var item in category.SubCategory)
                    {
                        List<Item.Domain.Models.Item> Items = context.Item.Where(x => x.SubCategoryId == item.Id).ToList();
                        context.Item.RemoveRange(Items);
                    }
                    if (context.SaveChanges() > 0)
                        flag = true;
                }
            }

            return flag;
        }
    }
}
