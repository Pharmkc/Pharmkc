
# Create a list of workers dynamically
workers <- list()
for (i in 1:400) {
  worker <- list(
    name = paste("Worker", i),
    salary = round(runif(1, 5000, 30000), 2),
    gender = sample(c("male", "female"), 1)
  )
  workers <- c(workers, list(worker))
}

# Generate payment slips for each worker
for (worker in workers) {
  tryCatch(
    expr = {
      # Conditional statements to assign employee level
      if (worker$salary > 10000 && worker$salary < 20000) {
        employee_level <- "A1"
      } else if (worker$salary > 7500 && worker$salary < 30000 && worker$gender == "female") {
        employee_level <- "A5-F"
      } else {
        employee_level <- "B1"
      }
      
      # Generate payment slip
      payment_slip <- paste(
        "Name:", worker$name,
        "Salary: $", worker$salary,
        "Employee Level:", employee_level,
        sep = "\n"
      )
      print(payment_slip)
    },
    error = function(e) {
      print(paste("Error generating payment slip for", worker$name, ":", e))
    }
  )
}

