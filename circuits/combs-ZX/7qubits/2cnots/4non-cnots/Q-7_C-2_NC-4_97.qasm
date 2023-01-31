OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
z q[6];
z q[0];
z q[1];
z q[2];
cx q[2], q[3];
cx q[6], q[4];
