using System.Collections.Generic;

namespace Item.Domain.Abstract
{
    public interface IGetItems
    {
        public List<Item.Domain.Models.Item> GetItemsByname(string name);
    }
}
