include <../config.scad>;
use <top_plate.scad>;
use <spacer.scad>;
use <back_plate.scad>;
use <compartment.scad>;

gap = 8;
totalWidth = countX * cellSize;
totalDepth = countY * cellSize;
stackHeight = compartmentHeight + backPlateHeight + spacerHeight + spacerKeyHeight + plateHeight + pixelHeight + 3 * gap;

$vpt = [totalWidth / 2, totalDepth / 2, stackHeight / 2];
$vpr = [65, 0, 325];
$vpd = 550;

// Compartment (bottom)
color("DimGray") compartment();

// Back plate
translate([0, 0, compartmentHeight + gap])
    color("Gray") back_plate();

// Spacer (flipped so keys face down toward back plate)
translate([0, 0, compartmentHeight + backPlateHeight + spacerHeight + spacerKeyHeight + 2 * gap])
    mirror([0, 0, 1])
        color("Silver") spacer();

// Top plate
translate([0, 0, compartmentHeight + backPlateHeight + spacerHeight + spacerKeyHeight + 3 * gap])
    top_plate();
