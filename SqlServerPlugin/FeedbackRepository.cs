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
    public class FeedbackRepository : IFeedbackRepository
    {
        private readonly CustomDBContext _dbContext;

        public FeedbackRepository(CustomDBContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<List<Feedback>> GetAllFeedbacksAsync()
        {
            return await _dbContext.Feedbacks
                .Select(feedback => new Feedback
                {
                    ID = feedback.ID,
                    InParent = feedback.InParent,
                    AnswerTime = feedback.AnswerTime,
                    TeacherID = feedback.TeacherID,
                    StudentID = feedback.StudentID,
                    SubjectID = feedback.SubjectID
                })
                .ToListAsync();
        }
    }
}
