using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.DTOs.Admin
{
    public class CompanyMasterDTO
    {
        public int CompanyId { get; set; }  
        public string CompanyName { get; set;}
    }

    public class CompanyList
    {
       public IEnumerable<CompanyMasterDTO> Companies { get; set; }
    }
}
