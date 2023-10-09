using Application.DTOs.SupportTicket;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Interfaces.SupportTicket
{
    public interface ISupportTicket
    {
        public Task<TicketList> ManageTicket(SupportTicketDTO supportTicketDTO);
        public Task<ClientUserTicketList> SupportTickets_GetByUserId(SupportTicketDTO supportTicketDTO);
        public Task<TicketList> SupportTickets_GetTicketDetails(SupportTicketDTO supportTicketDTO);


    }
}
