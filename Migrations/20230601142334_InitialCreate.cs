﻿using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace csharp002_webapi.Migrations
{
    /// <inheritdoc />
    public partial class InitialCreate : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Characters",
                columns: table => new
                {
                    Id = table.Column<int>(type: "NUMBER(10)", nullable: false)
                        .Annotation("Oracle:Identity", "START WITH 1 INCREMENT BY 1"),
                    Name = table.Column<string>(type: "NVARCHAR2(2000)", nullable: false),
                    HitPoints = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    Strength = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    Defense = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    Intelligence = table.Column<int>(type: "NUMBER(10)", nullable: false),
                    Class = table.Column<int>(type: "NUMBER(10)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Characters", x => x.Id);
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Characters");
        }
    }
}
