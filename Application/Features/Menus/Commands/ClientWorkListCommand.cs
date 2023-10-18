using Application.DTOs.SupportTicket;
using Application.Features.SupportTicket;
using Application.Interfaces;
using Application.Interfaces.SupportTicket;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Features.Menus.Commands
{
    public class ClientWorkListCommand : IRequest<ClientWorkList>
    {
        public SupportTicketDTO supportTicketDTO { get; set; }
       
    }
    internal class ClientWorkListCommandHandler : IRequestHandler<ClientWorkListCommand, ClientWorkList>
    {
        protected readonly IClientWorkList _clientWorkList;
        public ClientWorkListCommandHandler(IClientWorkList clientWorkList)
        {
            _clientWorkList = clientWorkList;
        }
        public async Task<ClientWorkList> Handle(ClientWorkListCommand request, CancellationToken cancellationToken)
        {
            return await _clientWorkList.SupportTicket_TicketWorkList(request.supportTicketDTO);
        }
    }
}
