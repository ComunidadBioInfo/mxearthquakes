test_that("earthquakes_energy", {
    options("scipen"=100, "digits"=4)
    expect_equal(earthquakes_energy(6, "joule"), 63095734448019)
    expect_equal(earthquakes_energy(6, "erg"),  630957344480194330644)
})
