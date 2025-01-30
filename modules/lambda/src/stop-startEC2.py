import boto3
region = "us-east-1"

# Initialize EC2 client
ec2 = boto3.client('ec2' , region_name = region)

def lambda_handler(event, context):
    instance_ids = ["i-000b3af92d57f8c33", "i-015a1c086635384e5"]  #EC2

    #stop or start
    action = event.get('action', 'stop')    # Default to stopping, ACTION is a variable that 
                                            # needs to be passed dynamically
        
    if action == "stop":
        response = ec2.stop_instances(InstanceIds=instance_ids)
        print(f"Stopping EC2 instances: {instance_ids}" )
    elif action == "start":
        response = ec2.start_instances(InstanceIds=instance_ids)
        print(f"Starting EC2 instances: {instance_ids}" )

    return response