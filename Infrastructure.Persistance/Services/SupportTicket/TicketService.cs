using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Application.DTOs.Admin;
using Application.DTOs.SupportTicket;
using Application.Interfaces.SupportTicket;
using Domain.Settings;
using Infrastructure.Persistance.Services.User;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Dapper;
using System.ComponentModel.Design;
using System.Runtime.InteropServices.JavaScript;
using System.Diagnostics;
using Microsoft.VisualBasic;

namespace Infrastructure.Persistance.Services.SupportTicket
{
    public class TicketService : DABase, ISupportTicket
    {
        APISettings _settings;
        private const string SP_ManageTicket_CRUD = "ManageTicket_CRUD";
        private const string SP_SupportTickets_GetByUserId = "SupportTickets_GetByUserId";
        private ILogger<TicketService> _logger;

        public TicketService(IOptions<ConnectionSettings> connectionSettings, ILogger<TicketService> logger, IOptions<APISettings> settings) : base(connectionSettings.Value.DBCONN)
        {
            _logger = logger;
            _settings = settings.Value;
        }

        public async Task<TicketList> ManageTicket(SupportTicketDTO supportTicketDTO)
        {
            TicketList response = new TicketList();

            _logger.LogInformation($"Started fetching all workcenter by workCenterId {supportTicketDTO.TicketId}");
            try
            {
                //supportTicketDTO.TargetDate = Convert.ToDateTime( "2023-10-04 16:24:45.493");
                using (SqlConnection connection = new SqlConnection(base.ConnectionString))
                {
                    response.Tickets = await connection.QueryAsync<SupportTicketDTO>(SP_ManageTicket_CRUD, new
                    {
                        TicketId = supportTicketDTO.TicketId,
                        Title = supportTicketDTO.Title,
                        TDesc = supportTicketDTO.TicketDesc,
                        TType = supportTicketDTO.TicketType,
                        Category = supportTicketDTO.Category,
                        TagList = supportTicketDTO.TagList,
                        AssignedTo = supportTicketDTO.AssignedTo,
                        TicketStatus = supportTicketDTO.TicketStatus,
                        TPriority = supportTicketDTO.TicketPriority,
                        AffectsCustomer = supportTicketDTO.AffectsCustomer,
                        AppVersion = supportTicketDTO.AppVersion,
                        EstimatedDuration = supportTicketDTO.EstimatedDuration,
                        ActualDuration = supportTicketDTO.ActualDuration,
                        IsActive = supportTicketDTO.IsActive,
                        IsDeleted = supportTicketDTO.IsDeleted,
                        ActionUser = supportTicketDTO.ActionUser,
                        ProjectId = supportTicketDTO.ProjectId,
                        CompanyId = supportTicketDTO.CompanyId,
                        TargetDate = supportTicketDTO.TargetDate,
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
        public async Task<ClientUserTicketList> SupportTickets_GetByUserId(SupportTicketDTO supportTicketDTO)
        {
            ClientUserTicketList response = new ClientUserTicketList();

            _logger.LogInformation($"Started fetching all support tickets for the logged in user {supportTicketDTO.ActionUser}");
            try
            {
                using (SqlConnection connection = new SqlConnection(base.ConnectionString))
                {
                    var reader = await connection.QueryMultipleAsync(SP_SupportTickets_GetByUserId, new
                    {
                        ActionUser = supportTicketDTO.ActionUser,
                        CompanyId = supportTicketDTO.CompanyId,
                    }, commandType: CommandType.StoredProcedure);

                    response.ActiveTickets = await reader.ReadAsync<SupportTicketDTO>();
                    response.InprogressTickets = await reader.ReadAsync<SupportTicketDTO>();
                    response.ClosedTickets = await reader.ReadAsync<SupportTicketDTO>();

                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return response;
        }
    }
}
