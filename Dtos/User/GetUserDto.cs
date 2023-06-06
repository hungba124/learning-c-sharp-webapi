using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace csharp002_webapi.Dtos.Character
{
    public class GetUserDto
    {
        public int Id {get; set; }
        public string Username { get; set; } = string.Empty;
    }
}