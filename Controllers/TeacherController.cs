using BusinessLogic.Interface;
using BusinessLogic.TeacherUseCase;
using BusinessLogic.UseCase;
using Common.DTOs.Request;
using CoreEntities.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Runtime.CompilerServices;

namespace StudentTeacherManagementBE.Controllers
{
    [Route("[controller]")]
    [ApiController]
    [Authorize]
    public class TeacherController : ControllerBase
    {
        private readonly ITeacherService _teacherService;
        public TeacherController(ITeacherService teacherService)
        {
            this._teacherService = teacherService;
        }
        [HttpGet("get-all-teacher")]
        public IEnumerable<Teacher> GetAllTeacher()
        {
            return this._teacherService.GetAllTeacher();
        }

        [HttpDelete("Delete")]
        public async Task<IActionResult> DeleteTeacher(Guid id)
        {
            try
            {
                await _teacherService.DeleteTeacher(id);
                return NoContent(); // Trả về 204 No Content
            }
            catch (KeyNotFoundException)
            {
                return NotFound("Teacher not found.");
            }
        }

        [HttpGet("Search")]
        public async Task<IActionResult> GetTeacherById(Guid id)
        {
            var teacher = await _teacherService.GetTeacherById(id);
            if (teacher == null)
            {
                return NotFound("Teacher not found.");
            }

            return Ok(teacher);
        }

        [HttpPost("Add")]
        public async Task<IActionResult> AddTeacher([FromBody] TeacherRequest teacherDto)
        {
            if (teacherDto == null)
            {
                return BadRequest("Teacher data is null.");
            }

            await _teacherService.AddTeacher(teacherDto);
            return CreatedAtAction(nameof(AddTeacher), new { name = teacherDto.Name }, teacherDto);
        }

        [HttpGet("PageNumber")]
        public async Task<IActionResult> GetTeachers([FromQuery] int pageNumber = 1, [FromQuery] int pageSize = 10)
        {
            var teachers = await _teacherService.GetTeachers(pageNumber, pageSize);
            var totalCount = await _teacherService.GetTotalCount();

            var response = new
            {
                TotalCount = totalCount,
                PageNumber = pageNumber,
                PageSize = pageSize,
                Teachers = teachers
            };

            return Ok(response);
        }




    }
};