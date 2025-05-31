import logging
from aiogram import Bot, Dispatcher, executor

logging.basicConfig(level=logging.INFO)
bot = Bot(token="YOUR_TOKEN")
dp = Dispatcher(bot)

@dp.message_handler()
async def echo(message):
    await message.answer("Привет!")

if __name__ == "__main__":
    executor.start_polling(dp, skip_updates=True)