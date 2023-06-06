using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace csharp002_webapi.Dtos.Character
{
    public class UpdateUserDto
    {
        public string Password { get; set; } = string.Empty;
    }
}