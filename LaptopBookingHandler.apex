public class LaptopBookingHandler {
    public static void sendEmailNotification(List<Laptop_Bookings__c> lapList) {
        for (Laptop_Bookings__c lap : lapList) {
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setToAddresses(new List<String>{lap.Email__c}); // Ensure Email__c exists
            email.setSubject('Welcome to Laptop Rentals');
            String body = 'Dear ' + lap.Name + ', \n';
            body += 'Welcome to Laptop Rentals! \n';
            body += 'Amount: ' + lap.Amount__c + '\n'; // Ensure Amount__c exists
            body += 'Core Type: ' + lap.Core__c + '\n'; // Replace Core__c with correct API name
            body += 'Laptop Type: ' + lap.Laptop_Type__c + '\n'; // Replace Laptop_Type__c with correct API name
            email.setPlainTextBody(body);
            Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{email});
        }
    }
}
