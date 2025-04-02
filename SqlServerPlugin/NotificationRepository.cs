using BusinessLogic.Repository;
using CoreEntities.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SqlServerPlugin
{
    public class NotificationRepository : INotificationRepository
    {
        private readonly CustomDBContext _dbContext;

        public NotificationRepository(CustomDBContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<List<Notification>> GetNotificationsAsync()
        {
            return await _dbContext.Notifications.ToListAsync();
        }
    }
}
