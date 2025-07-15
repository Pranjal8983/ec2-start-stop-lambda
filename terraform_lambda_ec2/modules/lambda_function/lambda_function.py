
import boto3

def lambda_handler(event, context):
    ec2 = boto3.client('ec2')
    action = event.get("action")
    instance_id = event.get("instance_id")

    if not instance_id:
        return {"error": "Missing instance_id"}

    if action == "start":
        ec2.start_instances(InstanceIds=[instance_id])
        return {"message": f"Started {instance_id}"}
    elif action == "stop":
        ec2.stop_instances(InstanceIds=[instance_id])
        return {"message": f"Stopped {instance_id}"}
    else:
        return {"error": "Unknown action"}
