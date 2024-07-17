using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

[ApiController]
[Route("[controller]")]
public class UsersController : ControllerBase
{
    private readonly FirebaseService _firebaseService;

    public UsersController(FirebaseService firebaseService)
    {
        _firebaseService = firebaseService;
    }

    [HttpGet("{id}")]
    public async Task<IActionResult> GetUser(string id)
    {
        var user = await _firebaseService.GetUserAsync(id);
        if (user == null)
        {
            return NotFound(new { Message = $"User with ID {id} not found" });
        }
        return Ok(user);
    }

    [HttpPost]
    public async Task<IActionResult> AddUser(User user)
    {
        await _firebaseService.AddUserAsync(user);
        return CreatedAtAction(nameof(GetUser), new { id = user.Id }, user);
    }

    [HttpPut("{id}")]
    public async Task<IActionResult> UpdateUser(string id, User user)
    {
        if (id != user.Id)
        {
            return BadRequest(new { Message = "ID mismatch" });
        }
        await _firebaseService.UpdateUserAsync(user);
        return NoContent();
    }

    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteUser(string id)
    {
        await _firebaseService.DeleteUserAsync(id);
        return NoContent();
    }
}
