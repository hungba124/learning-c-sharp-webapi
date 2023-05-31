using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace csharp002_webapi.Services.CharacterService
{
    public interface ICharacterService
    {
        Task<List<Character>> GetAllCharacters();
        Task<Character> GetCharacterById(int id);
        Task<List<Character>> AddCharacter(Character newCharacter);
    }
}