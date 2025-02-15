// Task 17:
// Create a class called Book with properties like title, author, and publication year. Add
// methods to display the book’s details and a method to check if it’s over 10 years old.


class Book {
  late String title;
  late String author;
  late int publicationYear;


  Book(String title, String author, int publicationYear) {
    this.title = title;
    this.author = author;
    this.publicationYear = publicationYear;
  }

  displayDetail() {
    print("Titele : $title");
    print("Auther : $author");
    print("Publication Year : $publicationYear");
  }

  bool isOverTenYearsOld() {
    int currentYear = DateTime.now().year;
     return (currentYear - publicationYear) > 10;
  }

}

void main()
{
   Book book=Book("The Great Gatsby","F. Scott Fitzgerald", 1925);

   book.displayDetail();

   if (book.isOverTenYearsOld()) {
     print("This book is over 10 years old.");
   } else {
     print("This book is not over 10 years old.");
   }


}

