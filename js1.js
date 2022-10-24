
function choose_figure(f, n) {
    var points
    if (f == "Star")
        points = [320, 10,   350, 60,   420, 60,   350, 100,   360, 150,   320, 100,   280, 150,   290, 100,   220, 60,   290, 60]

    if (f == "Ring")
        points = [320, 10,   350, 60,   420, 60]

    for (var i = 0; i < points.length; i++) {
        if (i == n * 2) {
            var out = [points[i], points[i+1]]
            return out
        }
    }

    return Array(-1, -1)  // закончились точки в массиве points
}
