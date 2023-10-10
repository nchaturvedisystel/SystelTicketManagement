using Application.DTOs.SupportTicket;
using Application.Interfaces.SupportTicket;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Features.SupportTicket
{
    public class TicketDescriptionCommand : IRequest<TicketList>
    {
        public SupportTicketDTO supportTicketDTO { get; set; }
    }

    internal class TicketDescriptionCommandHandler : IRequestHandler<TicketDescriptionCommand, TicketList>
    {
        protected readonly ITicketDescription _supportTicket;
        public TicketDescriptionCommandHandler(ITicketDescription supportTicket)
        {
            _supportTicket = supportTicket;
        }
        public async Task<TicketList> Handle(TicketDescriptionCommand request, CancellationToken cancellationToken)
        {
            return await _supportTicket.TicketDescription(request.supportTicketDTO);
        }
    }
}
