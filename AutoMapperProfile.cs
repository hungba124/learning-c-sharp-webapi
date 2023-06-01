using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace csharp002_webapi
{
    public class AutoMapperProfile : Profile
    {
        public AutoMapperProfile ()
        {
            CreateMap<Character, GetCharacterDto>();
            CreateMap<AddCharacterDto, Character>();
            CreateMap<UpdateCharacterDto, Character>();
        }
    }
}