var builder = WebApplication.CreateBuilder(args);

// Adicionar o serviço FirebaseConfig
builder.Services.Configure<FirebaseConfig>(builder.Configuration.GetSection("FirebaseConfig"));

// Adicionar o serviço FirebaseService
builder.Services.AddSingleton<FirebaseService>();
builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
