// Micromouse PCB - only Dimension Layer

module micromouse_PCB() {
scale(1)
    linear_extrude(height = 1, center = true) 
    import(file = "MicromousePCB.svg", $fn=100);
}

// Test
micromouse_PCB();