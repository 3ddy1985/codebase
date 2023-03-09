# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


languages = Language.create([
    { name: "Python", color: "#3776AB" },
    { name: "C", color: "#A8B9CC" },
    { name: "C++", color: "#00599C" },
    { name: "Java", color: "#007396" },
    { name: "C#", color: "#5C2D91" },
    { name: "JavaScript", color: "#F7DF1E" },
    { name: "SQL", color: "#CC2927" },
    { name: "PHP", color: "#777BB4" },
    { name: "Swift", color: "#FFAC45" },
    { name: "Ruby", color: "#CC342D" },
    { name: "Bash", color: "#4EAA25" },
    { name: "React", color: "#61DAFB" },
    { name: "HTML", color: "#E44D26" },
    { name: "CSS", color: "#1572B6" },
    { name: "TypeScript", color: "#007ACC" },
    { name: "Go", color: "#00ADD8" },
    { name: "Rust", color: "#000000" },
    { name: "Kotlin", color: "#A97BFF" },
    { name: "Scala", color: "#DC322F" },
    { name: "Elixir", color: "#6E4A7E" },
    { name: "Haskell", color: "#5E5086" },
    { name: "Lua", color: "#000080" },
    { name: "Perl", color: "#39457E" },
    { name: "Assembly", color: "#6E4A7E"},
    { name: "R", color: "#276DC3" },
    { name: "Dart", color: "#00B4AB" },
    { name: "F#", color: "#378BBA" },
    { name: "Julia", color: "#9558B2" },
    { name: "Objective-C", color: "#438EFF" },
    { name: "CoffeeScript", color: "#244776" },
    { name: "Groovy", color: "#4298B8" },
    { name: "Visual Basic", color: "#9457A1" },
    { name: "Shell", color: "#89E051" },
    { name: "PowerShell", color: "#012456" },
    { name: "D", color: "#BA595E" },
    { name: "Matlab", color: "#0076A8" },
    { name: "Racket", color: "#A6E22E" },
    { name: "Scheme", color: "#1E4A7E" },
    { name: "Smalltalk", color: "#596706" },
    { name: "COBOL", color: "#FF0033" },
    { name: "Ada", color: "#02F88C" },
    { name: "Prolog", color: "#74283C" },
    { name: "Lisp", color: "#4FBD5B" },
    { name: "ActionScript", color: "#DB0000" },
    { name: "Groovy", color: "#4298B8" },
    { name: "Kotlin", color: "#A97BFF" },
    { name: "Dart", color: "#00B4AB" },
    { name: "Scratch", color: "#4D97FF" },
    { name: "BASIC", color: "#FF9800" },
    { name: "Delphi", color: "#B0CE4E" },
    { name: "Fortran", color: "#4D41B1" },
    { name: "Ladder Logic", color: "#EDF1F5" },
    { name: "LabVIEW", color: "#FFC300" },
    { name: "Swift", color: "#FFAC45" },
    { name: "ABAP", color: "#E8274B" },
    { name: "Apex", color: "#0070D2" },
    { name: "Clojure", color: "#DB5855" },
    { name: "Erlang", color: "#A90533" },
    { name: "Golang", color: "#00ADD8" },
    { name: "Haskell", color: "#5E5086" },
    { name: "Julia", color: "#9558B2" },
    { name: "Lua", color: "#000080" },
    { name: "Pascal", color: "#E3F171" },
    { name: "Perl", color: "#39457E" },
    { name: "Scala", color: "#DC322F" },
    { name: "Turing", color: "#FF7F50" },
    { name: "VHDL", color: "#543978" },
    { name: "Verilog", color: "#848CCF" },
    { name: "Wolfram", color: "#DD1100" }
])

User.create([
    { 
        email: "johndoe@example.com",
        password: "password",
        first_name: "John",
        last_name: "Doe",
        username: "johndoe",
        location: "New York, NY",
        bio: "I'm a software engineer with a passion for building web applications."
      },
      { 
        email: "janedoe@example.com",
        password: "password",
        first_name: "Jane",
        last_name: "Doe",
        username: "janedoe",
        location: "Los Angeles, CA",
        bio: "I'm a freelance writer and blogger who loves to travel and explore new places."
      },
      { 
        email: "bobsmith@example.com",
        password: "password",
        first_name: "Bob",
        last_name: "Smith",
        username: "bobsmith",
        location: "Chicago, IL",
        bio: "I'm a marketing professional with experience in digital and traditional advertising."
      },
      { 
        email: "sarahjones@example.com",
        password: "password",
        first_name: "Sarah",
        last_name: "Jones",
        username: "sarahjones",
        location: "San Francisco, CA",
        bio: "I'm a product manager at a tech startup, and I enjoy hiking and trying new restaurants in my free time."
      },
      {
        first_name: "Alice",
        last_name: "Anderson",
        email: "alice.anderson@example.com",
        username: "alice_anderson",
        password: "password",
        location: "Seattle, WA",
        bio: "I'm a graphic designer who specializes in branding and visual identity."
      },
      {
        first_name: "Benjamin",
        last_name: "Baker",
        email: "benjamin.baker@example.com",
        username: "benjamin_baker",
        password: "password",
        location: "Boston, MA",
        bio: "I'm a researcher in the field of cognitive psychology, with a focus on memory and attention."
      },
      {
        first_name: "Catherine",
        last_name: "Carter",
        email: "catherine.carter@example.com",
        username: "catherine_carter",
        password: "password",
        location: "Austin, TX",
        bio: "I'm a freelance software developer with expertise in front-end web development."
      },
      {
        first_name: "David",
        last_name: "Davis",
        email: "david.davis@example.com",
        username: "david_davis",
        password: "password",
        location: "Miami, FL",
        bio: "I'm a financial analyst with experience in corporate finance and investment management."
      },
      {
        first_name: "Emma",
        last_name: "Evans",
        email: "emma.evans@example.com",
        username: "emma_evans",
        password: "password",
        location: "Denver, CO",
        bio: "I'm a yoga instructor and wellness coach, with a passion for helping people achieve their health goals."
      },
      {
        first_name: "Frank",
        last_name: "Foster",
        email: "frank.foster@example.com",
        username: "frank_foster",
        password: "password",
        location: "Portland, OR",
        bio: "I'm a freelance writer and editor, with a focus on travel and lifestyle content."
      },
])

