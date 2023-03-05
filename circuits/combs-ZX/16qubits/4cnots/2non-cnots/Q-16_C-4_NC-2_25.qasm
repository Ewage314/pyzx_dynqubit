OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
z q[13];
z q[7];
cx q[5], q[2];
cx q[11], q[1];
cx q[10], q[12];
cx q[4], q[3];
