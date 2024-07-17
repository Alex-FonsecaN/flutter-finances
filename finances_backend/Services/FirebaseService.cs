using FirebaseAdmin;
using Google.Apis.Auth.OAuth2;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using RestSharp;
using System;
using System.Text.Json;
using System.Threading.Tasks;

public class FirebaseService
{
    private readonly string _databaseUrl;
    private readonly RestClient _client;
    private readonly ILogger<FirebaseService> _logger;

    public FirebaseService(IOptions<FirebaseConfig> config, ILogger<FirebaseService> logger)
    {
        _logger = logger;
        FirebaseApp.Create(new AppOptions
        {
            Credential = GoogleCredential.FromFile("firebase-config.json")
        });
        _databaseUrl = config.Value.DatabaseUrl.TrimEnd('/');
        _client = new RestClient(_databaseUrl);

        _logger.LogInformation("Firebase Realtime Database initialized with URL: {DatabaseUrl}", _databaseUrl);
    }

    public async Task<User> GetUserAsync(string id)
    {
        _logger.LogInformation("Getting user with ID: {Id}", id);
        var request = new RestRequest($"users/{id}.json", Method.Get);
        var response = await _client.ExecuteAsync(request);
        if (response.IsSuccessful && response.Content != "null")
        {
            var user = JsonSerializer.Deserialize<User>(response.Content);
            _logger.LogInformation("User found: {Id}", id);
            return user;
        }
        else
        {
            _logger.LogWarning("User not found: {Id}", id);
            return null;
        }
    }

    public async Task AddUserAsync(User user)
    {
        _logger.LogInformation("Adding user with ID: {Id}", user.Id);
        var request = new RestRequest($"users/{user.Id}.json", Method.Put);
        request.AddJsonBody(user);
        var response = await _client.ExecuteAsync(request);
        if (response.IsSuccessful)
        {
            _logger.LogInformation("User added: {Id}", user.Id);
        }
        else
        {
            _logger.LogError("Failed to add user: {Id} - Status: {Status} - Response: {Response}", user.Id, response.StatusCode, response.Content);
        }
    }

    public async Task UpdateUserAsync(User user)
    {
        _logger.LogInformation("Updating user with ID: {Id}", user.Id);
        var request = new RestRequest($"users/{user.Id}.json", Method.Put);
        request.AddJsonBody(user);
        var response = await _client.ExecuteAsync(request);
        if (response.IsSuccessful)
        {
            _logger.LogInformation("User updated: {Id}", user.Id);
        }
        else
        {
            _logger.LogError("Failed to update user: {Id} - Status: {Status} - Response: {Response}", user.Id, response.StatusCode, response.Content);
        }
    }

    public async Task DeleteUserAsync(string id)
    {
        _logger.LogInformation("Deleting user with ID: {Id}", id);
        var request = new RestRequest($"users/{id}.json", Method.Delete);
        var response = await _client.ExecuteAsync(request);
        if (response.IsSuccessful)
        {
            _logger.LogInformation("User deleted: {Id}", id);
        }
        else
        {
            _logger.LogError("Failed to delete user: {Id} - Status: {Status} - Response: {Response}", id, response.StatusCode, response.Content);
        }
    }
}
