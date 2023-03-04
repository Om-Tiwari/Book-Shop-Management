# greeting
import matplotlib.pyplot as plt
from datetime import date
import mysql.connector as sqltor
import pandas as pd
print("☞ﾟヮﾟ☞ AVERAGE BOOK STORE ☜ﾟヮﾟ☜".center(75))
print("WELCOME".center(75))

# importing some modules

# some repeating codes


def EXIT():
    print()
    print("THANK YOU SO MUCH!!!".center(75))
    exit()


def VIEW():
    print()
    bd = pd.read_sql("SELECT * FROM book_detail ;", book)
    print(bd)


def VIEW_BILLS():
    print()
    bh = pd.read_sql("SELECT * FROM bill_hist", book)
    print(bh)


# connecting mysql table
book = sqltor.connect(host="127.0.0.1", port="3306",
                      user="root", passwd="Nforce", database="book")
cur = book.cursor()

# opening screen
print()
while True:
    vb = str(input("Do you want to access Book shop? [y/n] :",)).lower()

    if vb == "y":
        print()
        print("**MENU**".center(75))
        print("Use the following numbers to do your tasks")
        print()
        print("(1)View books")
        print("(2)Add books")
        print("(3)Sell & Prepare a bill")
        print("(4)Increase stock of a book")
        print("(5)Exit program")
        print("(6)View billing history")
        print("(7)Examine your sales")
        print("(8)Repay the borrowing")
        print("(9)Edit book details or bill")
        print("(10)Get stock alert")
        print()
# doing tasks
        x = 1
        while x > 0:
            print()
            t = int(input("What do you want to do ?[1/2/3/4/5/6/7/8/9/10] :",))

            if t == 1:
                VIEW()

            elif t == 2:
                print()
                n = int(input("How many books you want to add :",))
                z = -1
                while z <= n-2:
                    print(
                        "Give the desired informations about the new book that you want to add")
                    sql = "INSERT INTO book_detail(title,author,isbn,year_pub,price_usd,qnty,genre) VALUES(%s,%s,%s,%s,%s,%s,%s)"
                    val_ele = [str(input("TITLE OF BOOK>>>:",)), str(input("AUTHORS NAME>>>:",)), int(input("ISBN NUMBER>>>:",)), int(
                        input("YEAR PUBLISHED>>>:",)), float(input("PRICE IN USD>>>:",)), int(input("QUANTITY>>>:",)), str(input("GENRE>>>:",))]
                    val = []
                    for t in val_ele:
                        val.append(t)
                    cur.execute(sql, val)
                    book.commit()
                    print("Book record inserted".center(75))
                    z = z + 1
                print('Here is the updated book store'.center(75))
                VIEW()

            elif t == 3:
                print()
                sid = int(input("Give the id of the book you want to sell:",))
                quantity = int(input("How many books you want to sell :",))
                print()
                print("Give the desired informations about the purchaser for records")
                print()
                pn = str(input("PURCHASER NAME>>>:"))
                cn = int(input("CONTACT NUMBER>>>:"))
                sql = "INSERT INTO bill_hist (purchaser_name, contact_no, b_book_id, b_qnty) VALUES ('%s',%s,%s,%s);" % (
                    pn, cn, sid, quantity)
                sql_pp = "UPDATE bill_hist SET price_pp = (SELECT price_usd FROM book.book_detail WHERE b_book_id = book_id);"
                sql_dt = "UPDATE bill_hist SET b_date = CURDATE() WHERE b_date IS NULL ;"
                sql_tp = "UPDATE bill_hist SET total_price = price_pp * b_qnty"
                sql_s = "UPDATE book_detail SET qnty = qnty - %s WHERE book_id = %s ;" % (
                    quantity, sid)
                cur.execute(sql)
                cur.execute(sql_pp)
                cur.execute(sql_dt)
                cur.execute(sql_tp)
                cur.execute(sql_s)
                book.commit()
                sql_yps = "UPDATE book.bill_hist SET payment_status = 'paid' WHERE purchaser_name = '%s'" % (
                    pn)
                sql_nps = "UPDATE book.bill_hist SET payment_status = 'unpaid' WHERE purchaser_name = '%s'" % (
                    pn)
                sql_bill = pd.read_sql(
                    "SELECT bill_id,purchaser_name,contact_no,b_book_id,b_qnty,price_pp,b_date,total_price,payment_status FROM bill_hist WHERE bill_id = (SELECT last_insert_id()) ;", book)
                print()
                print("0--> NO")
                print("1--> YES")
                ps = int(input("Will customer pay the bill ?[0/1]:",))
                while True:
                    if ps == 0:
                        print()
                        print("See you soon".center(75))
                        cur.execute(sql_nps)
                        # break

                    elif ps == 1:
                        print()
                        print("Thanks for your payment".center(75))
                        cur.execute(sql_yps)
                        break

                    else:
                        print("I don't understand that".center(75))
                        EXIT()

                print("INVOICE".center(75))
                print()
                today = date.today()
                print("NAME :", pn, "     DATE :", today)
                print(sql_bill)
                book.commit()

            elif t == 4:
                sid = int(
                    input("Give the id of the book you want to increase quantity of :",))
                quantity = int(input("How many books you want to increase :",))
                sql = "UPDATE book_detail SET qnty = qnty + %s WHERE book_id = %s ;" % (
                    quantity, sid)
                cur.execute(sql)
                book.commit()
                VIEW()

            elif t == 5:
                print()
                EXIT()

            elif t == 6:
                print()
                VIEW_BILLS()

            elif t == 7:
                q = "SELECT SUM(total_price) AS sales,b_date AS date FROM bill_hist GROUP BY b_date;"
                vs = pd.read_sql(q, book)
                plt.figure(figsize=(8, 6))
                plt.barh(vs.date, vs.sales, align='edge')
                plt.ylabel("Date")
                plt.xlabel("Sales")
                plt.title('BOOKS SALES')
                plt.yticks(vs.date)
                plt.grid(True)
                plt.show()

            elif t == 8:
                bi = int(input("Give the bill id with which book was borrowed :",))
                ups = "UPDATE `book`.`bill_hist` SET `payment_status` = 'paid' WHERE (`bill_id` = %s);" % (
                    bi)
                cur.execute(ups)
                book.commit()
                print("INVOICE".center(75))
                print()
                today = date.today()
                print("DATE :", today)
                up_sql_bill = pd.read_sql(
                    "SELECT * FROM book.bill_hist WHERE bill_id = %s;" % (bi), book)
                print(up_sql_bill)
                print()

            elif t == 9:
                print()
                print("0--> Book Details")
                print("1--> Bills")
                ps = int(input("What do you want to edit :",))
                if ps == 0:
                    print()
                    i = int(input("Give the id the book to be edited :",))
                    print('OK!! now give new details to fill up')
                    t = str(input("TITLE OF BOOK>>>:",))
                    a = str(input("AUTHORS NAME>>>:",))
                    isbn = int(input("ISBN NUMBER>>>:",))
                    y = int(input("YEAR PUBLISHED>>>:",))
                    p = float(input("PRICE IN USD>>>:",))
                    q = int(input("QUANTITY>>>:",))
                    g = str(input("GENRE>>>:",))
                    sql = "UPDATE book_detail SET title = '%s', author = '%s', isbn = '%s', year_pub = '%s', price_usd = '%s', qnty = '%s', genre = '%s' WHERE (book_id = '%s');" % (
                        t, a, isbn, y, p, q, g, i)
                    cur.execute(sql)
                    book.commit()
                    print(cur.rowcount, "Book record inserted".center(75))
                    print('Here is the updated book store'.center(75))
                    VIEW()
                if ps == 1:
                    print()
                    i = int(input("Give the id the bill to be edited :",))
                    print('OK!! now give new details to fill up')
                    pn = str(input("PURCHASER NAME>>>:"))
                    cn = int(input("CONTACT NUMBER>>>:"))
                    sql = "UPDATE bill_hist SET purchaser_name = '%s', contact_no = '%s' WHERE (bill_id = '%s');" % (
                        pn, cn, i)
                    cur.execute(sql)
                    book.commit()
                    print(cur.rowcount, "Bill record updated".center(75))
                    VIEW_BILLS()

            elif t == 10:
                print("Here's the book which are equal or less then 10 in quantity")
                print("Do increase stock of these books")
                print()
                sq = pd.read_sql(
                    "SELECT * FROM book.book_detail WHERE qnty <= 10 ;", book)
                print(sq)

            else:
                print()
                print("I can't understand that".center(75))
            x = x + 1
# for exit
    elif vb == "n":
        print()
        EXIT()

    else:
        print()
        print("Uhh...I don't undertand that".center(75))
