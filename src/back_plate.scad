include <../config.scad>;

totalWidth = countX * cellSize;
totalDepth = countY * cellSize;

difference() {
    cube([totalWidth, totalDepth, backPlateHeight]);

    for (y = [0:countY-1]) {
        // Cutout channel for LED strip
        translate([-0.01,
                   y * cellSize + (cellSize - backPlateCutoutWidth) / 2,
                   backPlateHeight - backPlateCutoutDepth])
            cube([totalWidth + 0.02, backPlateCutoutWidth, backPlateCutoutDepth + 0.01]);

        // Left wiring hole
        translate([spacerWall,
                   y * cellSize + (cellSize - backPlateCutoutWidth) / 2,
                   -0.01])
            cube([backPlateWiringHole, backPlateCutoutWidth, backPlateHeight + 0.02]);

        // Right wiring hole
        translate([totalWidth - spacerWall - backPlateWiringHole,
                   y * cellSize + (cellSize - backPlateCutoutWidth) / 2,
                   -0.01])
            cube([backPlateWiringHole, backPlateCutoutWidth, backPlateHeight + 0.02]);
    }
}
