using Application.DTOs.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.DTOs.SupportTicket
{
    public class SupportTicketDTO
    {
        public int TicketId { get; set; }
        public string Title { get; set; }
        public string TicketDesc { get; set; }
        public string TicketType { get; set; }
        public string Category { get; set; }
        public string TagList { get; set; }
        public string AssignedTo { get; set; }
        public string TicketStatus { get; set; }
        public string TicketPriority { get; set; }
        public string AffectsCustomer { get; set; }
        public string AppVersion { get;  set; }
        public DateTime DueDate { get; set; }
        public string EstimatedDuration { get; set; }
        public string ActualDuration { get; set; }
        public DateTime TargetDate { get; set; }
        public DateTime ResolutionDate { get; set;}
        public int IsActive { get; set; }
        public int IsDeleted { get; set; }
        public string TicketOwner { get; set; }
        public int ProjectId { get; set; }
        public int CompanyId { get; set; }
        public string CompanyName { get; set;}
        public string ProjectName { get; set;}
        public int ActionUser { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime ModifiedOn { get; set;}
    }

    public class TicketList
    {
        public IEnumerable<SupportTicketDTO> Tickets { get; set; }
    }
}
