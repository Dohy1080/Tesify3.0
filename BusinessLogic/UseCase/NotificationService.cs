using BusinessLogic.Interface;
using BusinessLogic.Repository;
using CoreEntities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic.UseCase
{
    public class NotificationService : INotificationService
    {
        private readonly INotificationRepository _repository;

        public NotificationService(INotificationRepository repository)
        {
           this. _repository = repository;
        }

        public async Task<List<Notification>> GetNotificationsAsync()
        {
            return await _repository.GetNotificationsAsync();
        }
    }
}
