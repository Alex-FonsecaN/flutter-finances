using Google.Cloud.Firestore;

[FirestoreData]
public class User
{
    [FirestoreProperty]
    public string Id { get; set; } = string.Empty;

    [FirestoreProperty]
    public string? Name { get; set; }

    [FirestoreProperty]
    public string? Email { get; set; }
}
