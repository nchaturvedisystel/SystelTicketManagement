using Application.DTOs.SupportTicket;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Interfaces.SupportTicket
{
    public interface ITicketActivity
    {
        public Task<TicketActivityList> TicketDescription(TicketActivityDTO ticketActivityDTO);
    }
}
