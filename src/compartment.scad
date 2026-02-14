include <../config.scad>;

totalWidth = countX * cellSize;
totalDepth = countY * cellSize;

difference() {
    // Outer shell
    cube([totalWidth, totalDepth, compartmentHeight]);

    // Inner cavity (open top)
    translate([compartmentWall, compartmentWall, compartmentBaseHeight])
        cube([totalWidth - 2 * compartmentWall,
              totalDepth - 2 * compartmentWall,
              compartmentHeight - compartmentBaseHeight + 0.01]);

    // Bottom wall hole (Y=0 face)
    if (compartmentHoles[0][0] > 0 && compartmentHoles[0][1] > 0)
        translate([(totalWidth - compartmentHoles[0][0]) / 2,
                   -0.01,
                   compartmentBaseHeight])
            cube([compartmentHoles[0][0], compartmentWall + 0.02, compartmentHoles[0][1]]);

    // Left wall hole (X=0 face)
    if (compartmentHoles[1][0] > 0 && compartmentHoles[1][1] > 0)
        translate([-0.01,
                   (totalDepth - compartmentHoles[1][0]) / 2,
                   compartmentBaseHeight])
            cube([compartmentWall + 0.02, compartmentHoles[1][0], compartmentHoles[1][1]]);

    // Right wall hole (X=max face)
    if (compartmentHoles[2][0] > 0 && compartmentHoles[2][1] > 0)
        translate([totalWidth - compartmentWall - 0.01,
                   (totalDepth - compartmentHoles[2][0]) / 2,
                   compartmentBaseHeight])
            cube([compartmentWall + 0.02, compartmentHoles[2][0], compartmentHoles[2][1]]);

    // Top wall hole (Y=max face)
    if (compartmentHoles[3][0] > 0 && compartmentHoles[3][1] > 0)
        translate([(totalWidth - compartmentHoles[3][0]) / 2,
                   totalDepth - compartmentWall - 0.01,
                   compartmentBaseHeight])
            cube([compartmentHoles[3][0], compartmentWall + 0.02, compartmentHoles[3][1]]);
}
