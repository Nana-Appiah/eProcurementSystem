﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace DigiProc.Models.Domain
{
    [Table("ItemCategory")]
    public partial class ItemCategory
    {
        [Key]
        [Column("CategoryID")]
        public int CategoryId { get; set; }
        [StringLength(50)]
        [Unicode(false)]
        public string CategoryName { get; set; }
        [StringLength(200)]
        [Unicode(false)]
        public string CategoryDescription { get; set; }
    }
}