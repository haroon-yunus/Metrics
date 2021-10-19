resource "azurerm_monitor_action_group" "main" {
  name                = var.actiongrp
  resource_group_name = azurerm_resource_group.main.name
  short_name          = var.actiongrpshrt

  email_receiver {
    name          = "sendtoadmin"
    email_address = var.emailrecipient
  }
}

resource "azurerm_monitor_metric_alert" "networkbitspersec" {
  name                = var.networkbitspersec
  resource_group_name = var.resourcegroup
  scopes              = [azurerm_network_interface.to_monitor.id]
  description         = "Action will be triggered when Bits ingressing Azure per second is greater than XX."

  criteria {
    metric_namespace = "Microsoft.Network/connections"
    metric_name      = "BitsInPerSecond"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 50
  }

  action {
    action_group_id = azurerm_monitor_action_group.main.id
  }
}

resource "azurerm_monitor_metric_alert" "networkbitsoutpersec" {
  name                = var.networkbitsoutpersec
  resource_group_name = azurerm_resource_group.main.name
  scopes              = [azurerm_network_interface.to_monitor.id]
  description         = "Action will be triggered when Bits egressing Azure per second is greater than XX."

  criteria {
    metric_namespace = "Microsoft.Network/connections"
    metric_name      = "BitsOutPerSecond"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 50
  }

  action {
    action_group_id = azurerm_monitor_action_group.main.id
  }
}

resource "azurerm_monitor_metric_alert" "bytesrecdrate" {
  name                = var.bytesrecdrate
  resource_group_name = azurerm_resource_group.main.name
  scopes              = [azurerm_network_interface.to_monitor.id]
  description         = "Action will be triggered when Number of bytes the Network Interface received is greater than XX."

  criteria {
    metric_namespace = "Microsoft.Network/networkInterfaces"
    metric_name      = "Bytes Received"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 50
  }

  action {
    action_group_id = azurerm_monitor_action_group.main.id
  }
}

resource "azurerm_monitor_metric_alert" "averagebandwidth" {
  name                = var.averagebandwidth
  resource_group_name = azurerm_resource_group.main.name
  scopes              = [azurerm_network_interface.to_monitor.id]
  description         = "Action will be triggered when Site-to-site bandwidth of a gateway in bytes per second is greater than XX."

  criteria {
    metric_namespace = "microsoft.network/virtualnetworkgateways"
    metric_name      = "BytesPerSecond"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 50
  }

  action {
    action_group_id = azurerm_monitor_action_group.main.id
  }
}

#Microsoft.DataFactory/factories
resource "azurerm_monitor_metric_alert" "activitycancelledruns" {
  name                = var.activitycancelledruns
  resource_group_name = azurerm_resource_group.main.name
  scopes              = [azurerm_data_factory.to_monitor.id]
  description         = "Action will be triggered Cancelled activity runs metrics is greater than XX."

  criteria {
    metric_namespace = "Microsoft.DataFactory/factories"
    metric_name      = "Cancelled activity runs metrics"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 50
  }

  dimension {
    name     = ["ActivityType", "PipelineName", "FailureType", "Name"]
    operator = "Include"
    values   = ["*"]
  }

  action {
    action_group_id = azurerm_monitor_action_group.main.id
  }
}

resource "azurerm_monitor_metric_alert" "activityfailedruns" {
  name                = var.activityfailedruns
  resource_group_name = azurerm_resource_group.main.name
  scopes              = [azurerm_data_factory.to_monitor.id]
  description         = "Action will be triggered when Failed activity runs metrics is greater than XX."

  criteria {
    metric_namespace = "Microsoft.DataFactory/factories"
    metric_name      = "Failed activity runs metrics"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 50
  }

  dimension {
    name     = ["ActivityType", "PipelineName", "FailureType", "Name"]
    operator = "Include"
    values   = ["*"]
  }

  action {
    action_group_id = azurerm_monitor_action_group.main.id
  }
}

resource "azurerm_monitor_metric_alert" "ActivitySucceededRuns" {
  name                = var.activitysucceededruns
  resource_group_name = azurerm_resource_group.main.name
  scopes              = [azurerm_data_factory.to_monitor.id]
  description         = "Action will be triggered when Succeeded activity runs metrics is greater than XX."

  criteria {
    metric_namespace = "Microsoft.DataFactory/factories"
    metric_name      = "Succeeded activity runs metrics"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 50
  }

  dimension {
    name     = ["ActivityType", "PipelineName", "FailureType", "Name"]
    operator = "Include"
    values   = ["*"]
  }

  action {
    action_group_id = azurerm_monitor_action_group.main.id
  }
}

resource "azurerm_monitor_metric_alert" "factorysizeingbunits" {
  name                = var.factorysizeingbunits
  resource_group_name = azurerm_resource_group.main.name
  scopes              = [azurerm_data_factory.to_monitor.id]
  description         = "Action will be triggered when Total factory size (GB unit) is greater than XX."

  criteria {
    metric_namespace = "Microsoft.DataFactory/factories"
    metric_name      = "Total factory size (GB unit)"
    aggregation      = "Count"
    operator         = "Maximum"
    threshold        = 50
  }

  action {
    action_group_id = azurerm_monitor_action_group.main.id
  }
}

resource "azurerm_monitor_metric_alert" "integrationruntimeavailablememory" {
  name                = var.integrationruntimeavailablememory
  resource_group_name = azurerm_resource_group.main.name
  scopes              = [azurerm_data_factory.to_monitor.id]
  description         = "Action will be triggered when Integration runtime available memory is less than XX."

  criteria {
    metric_namespace = "Microsoft.DataFactory/factories"
    metric_name      = "Integration runtime available memory"
    aggregation      = "Bytes"
    operator         = "Average"
    threshold        = 50
  }

  action {
    action_group_id = azurerm_monitor_action_group.main.id
  }
}

resource "azurerm_monitor_metric_alert" "integrationruntimeavailablememory" {
  name                = var.integrationruntimeavailablememory
  resource_group_name = azurerm_resource_group.main.name
  scopes              = [azurerm_data_factory.to_monitor.id]
  description         = "Action will be triggered when Integration runtime available memory is less than XX."

  criteria {
    metric_namespace = "Microsoft.DataFactory/factories"
    metric_name      = "Integration runtime available memory"
    aggregation      = "Bytes"
    operator         = "Average"
    threshold        = 50
  }

  action {
    action_group_id = azurerm_monitor_action_group.main.id
  }
}



