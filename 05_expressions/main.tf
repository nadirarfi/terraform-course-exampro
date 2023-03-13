

output "example_1" {
  value = "Hi, my name is ${var.username}"
}

output "example_2" {
  value = "%{if var.username == ""}Please, enter your name.%{else} Hello, my name is ${var.username}%{endif}"
}


output "example_3" {
  value = [for world in var.worlds : upper(world)]
}

output "example_4" {
  value = {for i, world in var.worlds : "${i}" => world}
}

output "example_5" {
  value = [for k, v in var.worlds_map : upper(v)]
}

output "example_6" {
  value = [for k, v in var.worlds_map : upper(k) if upper(v)!= "MARS"]
}

output "example_7" {
 value = var.worlds_splat[*].earth_name
}

output "example_8" {
 value = [for name in var.worlds_splat : upper(name.earth_name)]
}