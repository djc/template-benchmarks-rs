
use criterion;

pub fn big_table(b: &mut criterion::Bencher, size: &usize) {
    let mut table = Vec::with_capacity(*size);
    for _ in 0..*size {
        let mut inner = Vec::with_capacity(*size);
        for i in 0..*size {
            inner.push(i);
        }
        table.push(inner);
    }
    let output = fomat!(
            "<table>\n"
            for r1 in table {
                "<tr>\n" 
                for r2 in &r1 { "<td>"(r2)"</td>" }
                "\n</tr>\n"
            }
            "</table>"
            );
    b.iter(|| output.to_owned());
}

struct BigTable {
    table: Vec<Vec<usize>>,
}

pub fn teams(b: &mut criterion::Bencher, _: &usize) {
    let teams = Teams {
        year: 2015,
        teams: vec![
            Team { name: "Jiangsu".into(), score: 43 },
            Team { name: "Beijing".into(), score: 27 },
            Team { name: "Guangzhou".into(), score: 22 },
            Team { name: "Shandong".into(), score: 12 },
        ],
    };
    let output = fomat!(
"<html>
  <head>
    <title>"(teams.year)"</title>
  </head>
  <body>
    <h1>CSL "(teams.year)"</h1>
    <ul>"
    for (i,team) in (&teams).teams.iter().enumerate() {
        "    <li class=\""(match i {
            0 => { "champion" }
            _ => { "" }
        })"\">\n"
            "      <b>"(team.name)"</b>: "(team.score)
"\n    </li>\n"
    }
"\n   </ul>
  </body>
</html>");
    b.iter(|| output.to_owned());
}

struct Teams {
    year: u16,
    teams: Vec<Team>,
}

struct Team {
    name: String,
    score: u8,
}
