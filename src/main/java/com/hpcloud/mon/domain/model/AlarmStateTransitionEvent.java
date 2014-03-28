package com.hpcloud.mon.domain.model;

import com.fasterxml.jackson.annotation.JsonRootName;
import com.hpcloud.mon.common.model.alarm.AlarmState;

/**
 * Represents an alarm state transition having occurred.
 * 
 * @author Jonathan Halterman
 */
@JsonRootName(value = "alarm-transitioned")
public class AlarmStateTransitionEvent {
  public String tenantId;
  public String alarmId;
  public String alarmName;
  public String alarmDescription;
  public AlarmState oldState;
  public AlarmState newState;
  public String stateChangeReason;
  public long timestamp;

  public AlarmStateTransitionEvent() {
  }

  public AlarmStateTransitionEvent(String tenantId, String alarmId, String alarmName, String alarmDescription,
      AlarmState oldState, AlarmState newState, String stateChangeReason, long timestamp) {
    this.tenantId = tenantId;
    this.alarmId = alarmId;
    this.alarmName = alarmName;
    this.alarmDescription = alarmDescription;
    this.oldState = oldState;
    this.newState = newState;
    this.stateChangeReason = stateChangeReason;
    this.timestamp = timestamp;
  }

  @Override
  public String toString() {
    return String.format(
        "AlarmStateTransitionEvent [tenantId=%s, alarmId=%s, alarmName=%s, alarmDescription=%s, oldState=%s, newState=%s, stateChangeReason=%s, timestamp=%s]",
        tenantId, alarmId, alarmName, alarmDescription, oldState, newState, stateChangeReason, timestamp);
  }
}
