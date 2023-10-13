using Application.DTOs;
using Application.Interfaces;
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
using Application.DTOs.Admin;
using Application.Interfaces.Admin;
using Application.DTOs.SupportTicket;
using Application.Interfaces.SupportTicket;

namespace Infrastructure.Persistance.Services
{
    public class MenuMasterService : DABase, IMenuContract, IMenuManage ,IClientWorkList , ITicketResolverList
    {
        private const string SP_UserRolesByUserId = "UserRolesByUserId";
        private const string SP_MenuMaster_CRUD = "MenuMaster_CRUD";
        private const string SP_AdminDashboard_GetDetails = "AdminDashboard_GetDetails";
        private const string SP_SupportTickets_GetByUserId = "SupportTickets_GetByUserId";
        private const string SP_SupportTicket_TicketWorkList = "SupportTicket_TicketWorkList";
        private const string SP_TicketResolverList = "TicketResolverList";


        private ILogger<MenuMasterService> _logger;
        public MenuMasterService(IOptions<ConnectionSettings> connectionSettings, ILogger<MenuMasterService> logger) : base(connectionSettings.Value.DBCONN)
        {
            _logger = logger;
        }

        public async Task<MenuMasterList> GetMenuForUser(int UserId)
        {
            MenuMasterList menuMasterInfo = new MenuMasterList();
            //IList<MenuMasterDTO> menuMasterInfo = null;
            var menuList = new object();
            _logger.LogInformation($"Started menu fetch for user id: {UserId}");

            using (SqlConnection connection = new SqlConnection(base.ConnectionString))
            {
                menuMasterInfo.Items = await connection.QueryAsync<MenuMasterDTO>(SP_UserRolesByUserId, new
                {
                    UserId = UserId

                }, commandType: CommandType.StoredProcedure);

            }
            return menuMasterInfo;
        }

        public async Task<MenuManageList> ManageMenu(MenuManageDTO menuManageDTO)
        {
            MenuManageList response = new MenuManageList();

            using (SqlConnection connection = new SqlConnection(base.ConnectionString))
            {
                response.Menus = await connection.QueryAsync<MenuManageDTO>(SP_MenuMaster_CRUD, new
                {

                    MenuId = menuManageDTO.MenuId,
                    MenuName = menuManageDTO.MenuName,
                    MenuCode = menuManageDTO.MenuCode,
                    MenuDesc = menuManageDTO.MenuDesc,
                    DisplayOrder = menuManageDTO.DisplayOrder,
                    ParentMenuId = menuManageDTO.ParentMenuId,
                    DefaultChildMenuId = menuManageDTO.DefaultChildMenuId,
                    MenuIconUrl = menuManageDTO.MenuIconUrl,
                    TemplatePath = menuManageDTO.TemplatePath,
                    IsActive = menuManageDTO.IsActive,
                    IsDeleted = menuManageDTO.IsDeleted,
                    ActionUser = menuManageDTO.ActionUser

                }, commandType: CommandType.StoredProcedure);

            }
            return response;
        }

        public async Task<AdminDashboardList> AdminDashboardGet(int ActionUser)
        {
            AdminDashboardList response = new AdminDashboardList();

            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                await connection.OpenAsync();

                using (var multi = await connection.QueryMultipleAsync(SP_AdminDashboard_GetDetails, commandType: CommandType.StoredProcedure))
                {
                    response.DashboardList = await multi.ReadAsync<DashboardHeaderDTO>();
                    response.WorkCenterList = await multi.ReadAsync<WorkCenterForDashboardDTO>();
                    response.PerformanceList = await multi.ReadAsync<UserPerformanceForDashboardDTO>();
                    response.ActivePagesList = await multi.ReadAsync<ActivePagesForDashboardDTO>();
                    response.ActiveRolesList = await multi.ReadAsync<RoleDetailsForDashboardDTO>();
                }
            }

            return response;
        }

        public async Task<ClientWorkList> SupportTicket_TicketWorkList(SupportTicketDTO supportTicketDTO)
        {
            ClientWorkList response = new ClientWorkList();

            _logger.LogInformation($"Started fetching all support tickets for the logged in user {supportTicketDTO.ActionUser}");
            try
            {
                using (SqlConnection connection = new SqlConnection(base.ConnectionString))
                {
                    var reader = await connection.QueryMultipleAsync(SP_SupportTicket_TicketWorkList, new
                    {
                        ActionUser = supportTicketDTO.ActionUser,
                        CompanyId = supportTicketDTO.CompanyId,
                    }, commandType: CommandType.StoredProcedure);

                    response.WorkInProgress = await reader.ReadAsync<SupportTicketDTO>();
                    response.AssignedToMe = await reader.ReadAsync<SupportTicketDTO>();
                    response.OpenTickets = await reader.ReadAsync<SupportTicketDTO>();
                    response.ClosedTickets = await reader.ReadAsync<SupportTicketDTO>();
                    response.AssignedToOthers = await reader.ReadAsync<SupportTicketDTO>();


                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return response;
        }

        public async Task<TicketList> TicketResolverList(SupportTicketDTO supportTicketDTO)
        {
            TicketList response = new TicketList();

            _logger.LogInformation($"Started fetching all support tickets for the logged in user {supportTicketDTO.ActionUser}");
            try
            {
                using (SqlConnection connection = new SqlConnection(base.ConnectionString))
                {
                    response.Tickets = await connection.QueryAsync<SupportTicketDTO>(SP_TicketResolverList, new
                    {
                        //TicketId = supportTicketDTO.TicketId,
                        //ModifiedBy = supportTicketDTO.ModifiedBy,
                        //AssignedTo = supportTicketDTO.AssignedTo,
                    }, commandType: CommandType.StoredProcedure);

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
