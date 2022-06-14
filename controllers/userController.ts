import { PrismaClient } from '@prisma/client';
import express from 'express';

const router = express.Router();

const prisma = new PrismaClient();

router.get('/', async (req, res) => {
    const users = await prisma.user.findMany({});
    res.json(users);
});

router.get('/:id', async (req, res) => {
    const { id } = req.params;
    const user = await prisma.user.findUnique({
        where: { id: Number(id) },
    });
    if (user !== null) {
        res.json(user);
    } else {
        res.status(400).json({ message: 'No user found' });
    }
});

export default router;
