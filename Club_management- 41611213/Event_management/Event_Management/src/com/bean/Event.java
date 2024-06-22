package com.bean;

import java.time.LocalDate;

public class Event {
    private int id;
    private String name;
    private LocalDate date;
    private String venue;
    private String description;
    private String requirements;

    // Default constructor
    public Event() {
    }

    // Parameterized constructor
    public Event(String name, LocalDate date, String venue, String description, String requirements) {
    	this.name = name;
        this.date = date;
        this.venue = venue;
        this.description = description;
        this.requirements = requirements;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public String getVenue() {
        return venue;
    }

    public void setVenue(String venue) {
        this.venue = venue;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getRequirements() {
        return requirements;
    }

    public void setRequirements(String requirements) {
        this.requirements = requirements;
    }

    // toString method for debugging purposes
    @Override
    public String toString() {
        return "Event{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", date=" + date +
                ", venue='" + venue + '\'' +
                ", description='" + description + '\'' +
                ", requirements='" + requirements + '\'' +
                '}';
    }
}
