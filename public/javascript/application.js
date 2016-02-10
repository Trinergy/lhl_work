$(document).ready(function() {

  $('.btnCreate').on('click', function() {
    $('#contactList').hide();
    $('#searchContactForm').hide();
    $('#newContactForm').show();
    $('#deleteContactForm').hide();
  });

  $('.btnAll').on('click', function() {
    $('#newContactForm').hide();
    $.getJSON( "/contacts", function(contacts) {
      var table = $('#contactList').find('tbody').empty();
      contacts.forEach(function(contact) {
        var tr = $('<tr>').addClass('contact').appendTo(table);
        $('<td>').appendTo(tr).text(contact.id + " " + contact.nickname);
        $('<td>').appendTo(tr).text(contact.first_name);
        $('<td>').appendTo(tr).text(contact.last_name);
        $('<td>').appendTo(tr).text(contact.phone_number);
        $('<td>').appendTo(tr).text(contact.email);
        $('#contactList').fadeIn('slow');
      });
    });
  });

  $('#newContactForm').on('submit', function() {
    var nickname = $('#nickname').val();
    var firstName = $('#firstName').val();
    var lastName = $('#lastName').val();
    var phoneNumber = $('#phoneNumber').val();
    var email = $('#email').val();

    if (nickname == "" || firstName == "" || lastName == "" || phoneNumber == "" || email == "") {
      alert("You must fill out all the fields!");
      return false;
    }

    $.post('/contacts/new', {nickname: nickname, 
                             first_name: firstName, 
                             last_name: lastName,
                             phone_number: phoneNumber,
                             email: email}, function(data) {
                             if (data.result) {
                              $('#nickname').add('#firstName').add('#lastName').add('#phoneNumber').add('#email').val('');
                              alert("Contact added. ID is: " + data.id);
                            } else {
                              alert("not added :(");
                            }
                           }, 'json');
    return false;
  });

  $('.btnSearch').on('click', function() {
    $('#contactList').hide();
    $('#searchContactForm').show();
    $('#newContactForm').hide();
    $('#deleteContactForm').hide();
  });

  $('#searchContactForm').on('click', '#searchBtn', function() {
    var contactId = $('#contactId').val();

    $.getJSON('/contacts/search', {id: contactId}, function(contact) {
      if (contact.result === false) {
        alert("Noting Found!");
      } else {
        var table = $('#contactList').find('tbody').empty();
        var tr = $('<tr>').addClass('contact').appendTo(table);
        $('<td>').appendTo(tr).text(contact.id + " " + contact.nickname);
        $('<td>').appendTo(tr).text(contact.first_name);
        $('<td>').appendTo(tr).text(contact.last_name);
        $('<td>').appendTo(tr).text(contact.phone_number);
        $('<td>').appendTo(tr).text(contact.email);
        $('#contactList').fadeIn('slow');
      }
    });
    //   if (data.result) {
    //     alert("Contact found!");
    //   } else {
    //     alert("No Contact with that ID");
    //   }
    // }, 'json');
    // return false;
  });

  $('.btnDelete').on('click', function() {
    $('#contactList').hide();
    $('#searchContactForm').hide();
    $('#newContactForm').hide();
    $('#deleteContactForm').show();
  });

  $('#deleteContactForm').on('click', '#deleteBtn', function() {
    var deleteId = $('#deleteId').val();
    $.getJSON('/contacts/delete', {id: deleteId}, function(contact) {
      if (contact.result === false) {
        alert("delete failed");
      } else {
        alert("contact deleted");
      }
    });
  });


  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
