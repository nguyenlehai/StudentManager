﻿using exam.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace exam.Repository
{
    public class NationRepository : Repository<Nation>
    {
        public NationRepository(ApplicationDbContext context) : base(context)
        {
        }

        public async Task<Nation> FindByName(string name)
        {
            return await _context.Nations.Where(c => c.Name.Equals(name)).FirstOrDefaultAsync();
        }
    }
}
