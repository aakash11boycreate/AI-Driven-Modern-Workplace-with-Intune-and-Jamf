{
  "schema": "https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json#",
  "actions": {
    "lock_user_account": {
      "type": "AzureAD/blockUser",
      "inputs": {
        "userId": "@triggerBody()?['UserId']"
      }
    },
    "reset_password": {
      "type": "AzureAD/resetPassword",
      "inputs": {
        "userId": "@triggerBody()?['UserId']"
      }
    },
    "notify_user": {
      "type": "SendEmail",
      "inputs": {
        "emailAddress": "@triggerBody()?['UserEmail']",
        "subject": "Your account has been locked",
        "body": "Your account has been locked due to suspicious activity. Please contact support to reset your credentials."
      }
    },
    "notify_team": {
      "type": "SendEmail",
      "inputs": {
        "emailAddress": "securityteam@company.com",
        "subject": "User Account Locked",
        "body": "User @triggerBody()?['UserId'] has been locked due to suspicious activity."
      }
    }
  },
  "triggers": {
    "SuspiciousActivityAlert": {
      "type": "Microsoft.Sentinel/alert",
      "inputs": {
        "severity": "Medium",
        "category": "Suspicious Activity"
      }
    }
  }
}
