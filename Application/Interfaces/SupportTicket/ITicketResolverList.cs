using Application.DTOs.SupportTicket;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Interfaces.SupportTicket
{
    public interface ITicketResolverList
    {
        public Task<TicketList> TicketResolverList(SupportTicketDTO supportTicketDTO);
    }
}
