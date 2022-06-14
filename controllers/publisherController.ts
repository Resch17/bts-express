import { PrismaClient } from '@prisma/client';
import express from 'express';

const router = express.Router();

const prisma = new PrismaClient();

router.get('/', async (req, res) => {
    const publishers = await prisma.publisher.findMany({});
    res.json(publishers);
});

router.get('/:id', async (req, res) => {
    const { id } = req.params;
    const publisher = await prisma.publisher.findUnique({
        where: { id: Number(id) },
    });
    if (publisher !== null) {
        res.json(publisher);
    } else {
        res.status(400).json({ message: 'No publisher found' });
    }
});

export default router;
