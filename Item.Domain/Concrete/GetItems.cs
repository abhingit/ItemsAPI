using Item.Domain.Abstract;
using Item.Domain.Models;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;

namespace Item.Domain.Concrete
{
    public class GetItems : IGetItems
    {
        public List<Item.Domain.Models.Item> GetItemsByname(string name)
        {
            using (var context = new ItemAPIContext())
            {
                if (!string.IsNullOrEmpty(name))
                    return context.Item.Where(x => x.Name.Contains(name)).Include(x => x.SubCategory).ThenInclude(x => x.Category).ToList();
                return context.Item.Include(x => x.SubCategory).ThenInclude(x => x.Category).ToList();
            }
        }
    }
}
