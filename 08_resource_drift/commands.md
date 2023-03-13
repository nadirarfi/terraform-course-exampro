

# Refresh only command
Let's assume, a resource was removed (server) through the AWS console. If we run an apply command, the server will be recreated. 

To avoid that, the state file must be updated/refreshed.

terraform apply -refresh-only


# Import command
If we create a resource in AWS manually, we can import it to our state to manage it with terraform. To do that, we need to grab the resource id and run the following command.


terraform import aws_s3_bucket.my_bucket nadir-bucket-imported-testing-1111