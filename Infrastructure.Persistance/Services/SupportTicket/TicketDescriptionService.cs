using Application.DTOs.SupportTicket;
using Domain.Settings;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using Application.Interfaces.SupportTicket;

namespace Infrastructure.Persistance.Services.SupportTicket
{
    public class TicketDescriptionService : DABase, ITicketDescription
    {
        APISettings _settings;
        private const string SP_InsertTicketDescription = "InsertTicketDescription";
       
        private ILogger<TicketService> _logger;

        public TicketDescriptionService(IOptions<ConnectionSettings> connectionSettings, ILogger<TicketService> logger, IOptions<APISettings> settings) : base(connectionSettings.Value.DBCONN)
        {
            _logger = logger;
            _settings = settings.Value;
        }

        public async Task<TicketList> TicketDescription(SupportTicketDTO supportTicketDTO)
        {
            TicketList response = new TicketList();

            _logger.LogInformation($"Started fetching all workcenter by workCenterId {supportTicketDTO.TicketId}");
            try
            {
                //supportTicketDTO.TargetDate = Convert.ToDateTime( "2023-10-04 16:24:45.493");
                using (SqlConnection connection = new SqlConnection(base.ConnectionString))
                {
                    response.Tickets = await connection.QueryAsync<SupportTicketDTO>(SP_InsertTicketDescription, new
                    {
                        TicketId = supportTicketDTO.TicketId,
                        TicketComments = supportTicketDTO.TicketComments,
                        CreatedBy = supportTicketDTO.CreatedBy,
                    }, commandType: CommandType.StoredProcedure);

                }
                //DueDate = supportTicketDTO.DueDate,
                //ResolutionDate = supportTicketDTO.ResolutionDate,
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return response;
        }
    }
}
