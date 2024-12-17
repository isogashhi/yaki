using System;
using System.IO;

namespace AuthApp
{
    class EntryPoint
    {
        static void Main(string[] args)
        {
            var authService = new AuthService();
            authService.Run();
        }
    }

    class AuthService
    {
        public void Run()
        {
            Console.WriteLine("Welcome! Please log in.");
            Console.Write("Login: ");
            string username = Console.ReadLine();
            Console.Write("Password: ");
            string userPassword = Console.ReadLine();

            if (ValidateAdmin(username, userPassword))
            {
                AdminPanel.Display();
            }
            else if (Educator.VerifyCredentials(username, userPassword))
            {
                var educator = new Educator(username);
                educator.ShowDashboard();
            }
            else if (Learner.VerifyCredentials(username, userPassword))
            {
                var learner = new Learner(username);
                learner.AccessPortal();
            }
            else
            {
                Console.WriteLine("Invalid credentials. Please try again.");
            }
        }

        private bool ValidateAdmin(string user, string pass)
        {
            return user == "admin" && pass == "admin123";
        }
    }

    static class AdminPanel
    {
        public static void Display()
        {
            Console.WriteLine("Welcome to the admin dashboard!");
            // Admin-specific functionality
        }
    }

    class Educator
    {
        private readonly string name;

        public Educator(string name)
        {
            this.name = name;
        }

        public static bool VerifyCredentials(string user, string pass)
        {
            // Placeholder for authentication logic for educators
            return user == "teacher" && pass == "teach123";
        }

        public void ShowDashboard()
        {
            Console.WriteLine($"Welcome, {name}. This is your teacher dashboard.");
            // Teacher-specific functionality
        }
    }

    class Learner
    {
        private readonly string identifier;

        public Learner(string id)
        {
            this.identifier = id;
        }

        public static bool VerifyCredentials(string user, string pass)
        {
            // Placeholder for authentication logic for students
            return user == "student" && pass == "learn123";
        }

        public void AccessPortal()
        {
            Console.WriteLine($"Hello, {identifier}. Accessing the student portal...");
            // Student-specific functionality
        }
    }
}
